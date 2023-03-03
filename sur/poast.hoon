=>  |%
    +$  id
      $@  @da
      [date=@da num=@ud]
    +$  poast
      $~  *[@p id @t ~]
      $:  =ship
          =id
          text=@t
          quote=(unit poast)
      ==
    ++  on-poast  ((on id poast) lte-ids)
    ++  lte-ids
      |=  [a=id b=id]
      ^-  ?
      ?@  a
        (lte a ?@(b b date.b))
      ?@  b
        (lte date.a b)
      ?:  =(date.a date.b)
        (lte num.a num.b)
      (lte date.a date.b)
    --
|%
++  name  %poast
+$  rock  ((mop id poast) lte-ids)
+$  wave
  $%  [%put =poast]               ::  add one new poast  ::  TODO remove
      [%gas poasts=(list poast)]  ::  add multiple new poasts
      [%del =id]                  ::  delete a poast
  ==
++  wash
  |=  [=rock =wave]
  ^+  rock
  ?-  -.wave
    %put  (put:on-poast rock [id .]:poast.wave)
    %gas  %+  gas:on-poast  rock
          (turn poasts.wave |=(p=poast [id .]:p))
    %del  +:(del:on-poast rock id.wave)
  ==
--