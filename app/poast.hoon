/+  verb, dbug, *sss, rudder, *poast
/~  pages  (page:rudder rock action)  /app/poast/webui
::
%-  agent:dbug
%+  verb  &
::
=/  subs  (mk-subs ..wave ,[%poast ~])
=/  pubs  (mk-pubs ..wave ,[%poast ~])
::
|_  =bowl:gall
+*  this  .
    su  =/  da  (da ..wave ,[%poast ~])
            ~(. da subs bowl -:!>(*result:da) -:!>(*from:da))
    pu  =/  du  (du ..wave ,[%poast ~])
            ~(. du pubs bowl -:!>(*result:du))
++  on-init
  ^-  (quip card:agent:gall _this)
  :_  this
  [%pass /whatever %arvo %e %connect [~ /poast] dap.bowl]~
++  on-save  !>([subs pubs])
++  on-load
  |=  =vase
  ^-  (quip card:agent:gall _this)
  =/  old  !<([=_subs =_pubs] vase)
  :-  [%pass /whatever %arvo %e %connect [~ /poast] dap.bowl]~
  %=  this
    subs  subs.old
    pubs  pubs.old
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card:agent:gall _this)
  ?+    mark  `this
      %handle-http-request
    =;  [fex=(list card:agent:gall) =rock]
      [fex this]  ::  TODO update state with rock
    %.  [bowl !<(order:rudder vase) *rock]  ::  TODO state
    %:  (steer:rudder rock action)
      pages
      (point:rudder /[dap.bowl] & ~(key by pages))
      (fours:rudder *rock)  ::  TODO state
      |=  =action
      ^-  $@  brief:rudder
          [brief:rudder (list card:agent:gall) rock]
      ?+    -.action  !!
          %new-poast
        :+  ~
          ::  TODO look up quoted poast by id
          =/  =poast  [our.bowl now.bowl text.action quote=~]
          =/  =cage  [%poast-wave !>(poast)]
          [%pass /new-poast %agent [our dap]:bowl %poke cage]~
        *rock  ::  TODO state
      ==
    ==
  ::
      %poast-wave
    =^  cards  pubs  (give:pu !<([[%poast ~] wave] vase))
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