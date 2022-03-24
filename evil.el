;;; evil.el --- evil setup
;; Evil mode

;;; Commentary:
;;

;;; Code:

;; evil key-binding
(use-package evil
  :ensure t
  :custom
  (evil-want-keybinding nil)
  (evil-want-integration t)
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-undo-system 'undo-tree)
  :bind
  (:map evil-normal-state-map
	("M-h" . 'evil-backward-char)
	("M-l" . 'evil-forward-char)
	("M-j" . 'evil-next-visual-line)
	("M-k" . 'evil-previous-visual-line)

	("g s s" . 'evil-avy-goto-char-timer)
	("C-k" . 'evil-previous-visual-line)
	("C-j" . 'evil-next-visual-line)
	("C-u" . 'evil-scroll-up)
	("C-w C-h" . 'evil-window-left)
	("C-w C-j" . 'evil-window-down)
	("C-w C-k" . 'evil-window-up)
	("C-w C-l" . 'evil-window-right))
  (:map evil-visual-state-map
	("C-j" . 'evil-next-visual-line)
	("C-u" . 'evil-scroll-up))
  (:map evil-insert-state-map
	("M-h" . (lambda() (interactive) (evil-normal-state)(evil-backward-char)))
	("M-l" . (lambda() (interactive) (evil-normal-state)(evil-forward-char)))
	("M-j" . (lambda() (interactive) (evil-normal-state)(evil-next-line)))
	("M-k" . (lambda() (interactive) (evil-normal-state)(evil-previous-line)))

	("C-j" . 'evil-next-visual-line)
	("C-k" . 'evil-previous-visual-line)
	("C-h" . 'evil-delete-backward-char)
	("C-g" . 'evil-normal-state)
	("C-a" . 'evil-first-non-blank)
	("C-e" . 'move-end-of-line)
	("C-u" . (lambda() (interactive) (evil-delete (point-at-bol)(point))))))

;; global evil key binding override
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

;; highlighting f/F/t/T candidate target and jumping around text
(use-package evil-snipe
  :after evil
  :ensure t
  :config
  (evil-snipe-override-mode +1)
  )

(provide 'k_evil)
;;; evil.el ends here
