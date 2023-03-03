/-  *poast
|%
+$  action
  $%  [%new-poast proto-poast]
      [%del-poast =id]
      [%new-thread poasts=(list proto-poast)]
      [%follow =ship]
      [%unfollow =ship]
  ==
+$  proto-poast
  $:  text=@t
      quote=(unit id)
  ==
++  form-to-action
  |=  form=(map @t @t)
  ^-  action
  =/  tag  (~(got by form) %tag)
  ?+    tag  !!
    %new-poast   tag^(form-to-proto-poast form)
    %del-poast   tag^(need (form-to-id form))
    %new-thread  !!
    %follow      tag^(form-to-ship form)
    %unfollow    !!
  ==
::
++  form-to-proto-poast
  |=  form=(map @t @t)
  ^-  proto-poast
  :-  text=(~(got by form) %text)
  (form-to-id form)
::
++  form-to-id
  |=  form=(map @t @t)
  ^-  (unit id)
  (bind (~(get by form) %id) (cury slav %da))
::
++  form-to-ship
  |=  form=(map @t @t)
  ^-  ship
  (slav %p (~(got by form) %ship))
--
