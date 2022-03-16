(use-package vterm
  :commands vterm
  :init
  (evil-set-initial-state 'vterm-mode 'emacs)
  :config
  (setq vterm-max-scrollback 10000)
  (define-key vterm-mode-map (kbd "C-u") 'vterm-send-C-u)
  :hook
  (vterm-mode . (lambda() (linum-mode -1)))
  )
