# OnlineATPs [![Build Status](https://travis-ci.org/jonaprieto/online-atps.svg?branch=master)](https://travis-ci.org/jonaprieto/online-atps)

  OnlineATPs is a command-line client for
  [TPTP World](http://www.cs.miami.edu/~tptp/cgi-bin/SystemOnTPTP)
  that allows us to take advantage of using
  [ATP](http://www.cs.miami.edu/~tptp/OverviewOfATP.html)s without install any of them.

#### Requirements

* OnlineATPs has been built and tested using [GHC](https://www.haskell.org/ghc/) 7.6.3, 7.8.4, 7.10.3, and 8.0.2. Check your version:

````bash
$ ghc --version
````

* Please install the last version of [Cabal](https://www.haskell.org/cabal/). OnlineATPs has been installed successfully using `cabal-1.22` and `cabal-1.24`

````bash
$ cabal update
$ cabal install cabal-install
$ cabal --version
````

#### Installation

````bash
$ git clone https://github.com/jonaprieto/online-atps.git
$ cd online-atps
$ cabal install
````

#### Usage

To take advantage of OnlineATPs, visit first
[SystemOnTPTP](http://www.cs.miami.edu/~tptp/cgi-bin/SystemOnTPTP) to understand what is about and see all
its options. Briefly, the work flow using OnlineATPs consists mainly in provide a problem in
[TSTP](http://www.cs.miami.edu/~tptp/TSTP/) format and at least one ATP name, then executing it, we get an output pretty similar to the answer given by a local ATP. Let see.

* See all ATPs available. Run this command:

````bash
$ online-atps --list-atps
````

* Check the `help` command to see all options of `online-atps`:

````bash
$ online-atps --help
````

* We can check if a problem (written using [TSTP Syntax](http://www.cs.miami.edu/~tptp/TPTP/SyntaxBNF.html) is a theorem or not. For instance, we have a problem, in this case a conjecture, like this one:

````bash
$ cat basic.tptp
fof(a1, axiom, a).
fof(a2, axiom, b).
fof(a3, axiom, (a & b) => z).
fof(a4, conjecture, z).

````


We can now run the ATPS, in this example, we send the paramenter `--atp=vampire` specifying that we are going to use [Vampire](http://www.vprover.org) ATP to solve the problem described above. Then, we should run in our shell something like:

```
$ online-atps basic.tptp --atp=vampire
% SZS start RequiredInformation
% Congratulations - you have become a registered power user of SystemOnTPTP,
at IP address 138.121.12.14.
% Please consider donating to the TPTP project - see www.tptp.org for
details.
% When you donate this message will disappear.
% If you do not donate a random delay might be added to your processing time.
% SZS end RequiredInformation
Vampire---4.1   system information being retrieved
Vampire---4.1's non-default parameters being retrieved
    -t none
    -f tptp:raw
    -x vampire --mode casc -m 90000 -t %d %s
Vampire---4.1   being checked for execution
Vampire---4.1   checking time limit 240
Vampire---4.1   checking problem name /tmp/SystemOnTPTPFormReply38743/
SOT_Xry401
...
% ------------------------------
% Version: Vampire 4.1 for CASC J8 Entry
% Termination reason: Refutation

% Memory used [KB]: 511
% Time elapsed: 0.043 s
% ------------------------------
% ------------------------------
% Success in time 0.045 s

% END OF SYSTEM OUTPUT
RESULT: SOT_Xry401 - Vampire---4.1 says Theorem - CPU = 0.00 WC = 0.04
OUTPUT: SOT_Xry401 - Vampire---4.1 says Refutation - CPU = 0.00 WC = 0.04

```

* OnlineATPs accepts a name for a ATP using the prefix "online-" or not (e.g "vampire" or "online-vampire")

````bash
$ online-atps basic.tptp --atp=online-metis
````

* Only check if a problem states a theorem or not using `--only-check`

````bash
$ online-atps basic.tptp --atp=online-metis --only-check
````

#### Contribute

Any contribution to improve this package is welcomed. Just check the issues or create a new one.

