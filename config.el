;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load! "+ui")
(load! "+prog")
(load! "+text")
(load! "+key")
(load! "+misc")
(load! "extra/hlsl-mode")

(setq user-full-name "Kingstom Chen"
      user-mail-address "kingstom.chen@amd.com")

(setq-default fill-column 120
              delete-trailing-lines t)
