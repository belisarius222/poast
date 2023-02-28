/-  poast
/+  verb, dbug, *sss
::
%-  agent:dbug
%+  verb  &
::
=/  subs  (mk-subs poast ,[%poast ~])
=/  pubs  (mk-pubs poast ,[%poast ~])
::
|_  =bowl:gall
+*  this  .
    su  =/  da  (da poast ,[%poast ~])
            ~(. da subs bowl -:!>(*result:da) -:!>(*from:da))
    pu  =/  du  (du poast ,[%poast ~])
            ~(. du pubs bowl -:!>(*result:du))
++  on-init  `this
++  on-save  !>([subs pubs])
++  on-load
  |=  =vase
  =/  old  !<([=_subs =_pubs] vase)
  :-  ~
  %=  this
    subs  subs.old
    pubs  pubs.old
  ==
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card:agent:gall _this)
  ?+    mark  `this
      %poast-wave
    =^  cards  pubs  (give:pu !<([[%poast ~] wave:poast] vase))
    ~&  >  "pubs is: {<read:pu>}"
    [cards this]
  ::
      %follow
    =-  ~&  >  "subs is: {<read:su>}"  -
    :_  this
    ~[(surf:su !<(@p (slot 2 vase)) %poast !<([%poast ~] (slot 3 vase)))]
  ::
      %rule
    =.  pubs  (rule:pu !<([[%poast ~] @ud @ud] vase))
    `this
  ::
      %wipe
    =.  pubs  (wipe:pu !<([%poast ~] vase))
    `this
  ::
      %sss-on-rock
    ?-    msg=!<($%(from:su) (fled vase))
        [[%poast ~] *]
      ~?  ?=(^ rock.msg)
        "last message from {<from.msg>} on {<src.msg>} is {<,.-.rock.msg>}"
      ?<  ?=([%crash *] rock.msg)
      `this
    ==
  ::
      %sss-to-pub
    ?-  msg=!<($%(into:pu) (fled vase))
        [[%poast ~] *]
      =^  cards  pubs  (apply:pu msg)
      ~&  >  "pubs is: {<read:pu>}"
      [cards this]
    ==
  ::
      %sss-poast
    =^  cards  subs  (apply:su !<(into:su (fled vase)))
    ~&  >  "subs is: {<read:su>}"
    [cards this]
  ==
++  on-agent
  |=  [=wire =sign:agent:gall]
  ^-  (quip card:agent:gall _this)
  ?>  ?=(%poke-ack -.sign)
  ?~  p.sign  `this
  %-  (slog u.p.sign)
  ?+    wire   `this
      [~ %sss %on-rock @ @ @ %poast ~]
    =.  subs  (chit:su |3:wire sign)
    ~&  >  "subs is: {<read:su>}"
    `this
  ==
++  on-arvo
  |=  [=wire sign=sign-arvo]
  ^-  (quip card:agent:gall _this)
  ?+  wire  `this
    [~ %sss %behn @ @ @ %poast ~]  [(behn:su |3:wire) this]
  ==
::
++  on-peek   _~
++  on-watch  _`this
++  on-leave  _`this
++  on-fail   _`this
--