/+  *poast, rudder
::
::  TODO ensure unique id
^-  (page:rudder rock action)
|_  [=bowl:gall =order:rudder rock]
++  argue
  |=  [headers=header-list:http body=(unit octs)]
  ^-  $@(brief:rudder action)
  %-  form-to-action
  ^-  (map @t @t)
  ?~(body ~ (frisk:rudder q.u.body))
::
++  final  (alert:rudder next=%index build)
::
++  build
  |=  [args=(list [k=@t v=@t]) msg=(unit [gud=? txt=@t])]
  ^-  reply:rudder
  :-  %page
  ^-  manx
  ;html
    ;body
      hello
    ==
  ==
--