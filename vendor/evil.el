;; Evil mode
(use-package evil
  :config
  (evil-mode)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
   (interactive)
   (evil-delete (point-at-bol) (point))))
  )
