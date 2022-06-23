from pyteal import *
from pyteal.ast.bytes import Bytes
from pyteal_helpers import program

def approval():
    # locals
    donated_balance = Bytes("donated_balance") # int
    donated_times = Bytes("donated_times") # int

    # globals
    donated_times = Bytes("donated_times") # int

    op_donate = Bytes("donate")

    @Subroutine(TealType.none)
    def donate(): 
        return Seq(
            # check size of the gtxn and the current gtxn index (for the app-call, is the first)
            program.check_self(
                group_size=Int(2),
                group_index=Int(0),
            ),
            program.check_rekey_zero(2), # check rekey prop to both txn's
            Assert(
                And(
                    Gtxn[1].type_enum() == TxnType.Payment,
                    Gtxn[1].receiver() == Global.current_application_address(),
                    Gtxn[1].close_remainder_to() == Global.zero_address(),
                    Txn.application_args.length() == Int(1),
                )
            ),
            App.localPut(
                Txn.sender(), 
                donated_balance, 
                App.localGet(Txn.sender(), donated_balance) + Gtxn[1].amount()
            ),
            App.localPut(
                Txn.sender(), 
                donated_times,
                App.localGet(Txn.sender(), donated_times) + Int(1)
            ),
            Approve(),
        )

    return program.event(
        init=Approve(),
        opt_in=Seq(
            App.localPut(Txn.sender(), donated_balance, Int(0)),
            App.localPut(Txn.sender(), donated_times, Int(0)),
            Approve(),
        ),
        delete=Seq(
            Assert(
                And(
                    Txn.sender() == Global.creator_address()
                )
            ),
            Approve(),
        ),
        update=Approve(),
        no_op=Seq(
            Cond(
                [
                    Txn.application_args[0] == op_donate, 
                    donate()
                ],
            ),
            Reject()
        ),
    ); 


def clear():
    return Approve(); 