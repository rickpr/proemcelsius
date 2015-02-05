# To Execute the Program using SWI-Prolog

From the root of this project, start the SWI-Prolog terminal by issuing the  the `swipl` command from a terminal or command prompt. Alternatively, the `swipl` command can be issued from another directory, and the working directory can be selected using the `working_directory` prolog command.

```
?- working_directory(CWD1,'C:/Users/Ahmad Slim/Desktop/StudProg').
```

Compile the `server.pl` file using the following command from the within the SWI_Prolog terminal application.

```
?- ['server'].
```
Compiling this file will include all of the necessary `.pl` files to be compiled as well.

Run the required rules. For example, you may wish to know if an undergraduate student satisfied his or her Civil Engineering degree program requirements. The following rule describes the requirements for that particular degree

```
-->  satisfyCE('BS',List).
```

Issuing the following in the SWI-Prolog terminal will evaluate the above rule.

```
?- satisfyCE('BS',['ECE 471','AFST 104','ECE 475']).
```
---

*Note* &nbsp; The following degree plans have been  completed thus far
* Civil Engineering &ndash; `CE_DegreeProgram.pl`
* Construction Engineering &ndash; `CONE_DegreeProgram.pl`
* Construction Management &ndash; `CONM_DegreeProgram.pl`
