;;; evil.el --- evil setup
;; Evil mode

;;; Commentary:
;;

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-tree)
  :bind
  (:map evil-normal-state-map
	("gss" . 'evil-avy-goto-char-timer)
	("\C-j/" . nil)
	("C-u" . 'evil-scroll-up)
	("C-w C-h" . 'evil-window-left)
	("C-w C-j" . 'evil-window-down)
	("C-w C-k" . 'evil-window-up)
	("C-w C-l" . 'evil-window-right))
  (:map evil-visual-state-map
	("\C-j/" . nil)
	("C-u" . 'evil-scroll-up))
  (:map evil-insert-state-map
	("C-j" . nil)
	("C-h" . 'evil-delete-backward-char)
	("C-g" . 'evil-normal-state)
	("C-a" . 'evil-first-non-blank)
	("C-e" . 'move-end-of-line)
	("C-u" . (lambda() (interactive) (evil-delete (point-at-bol)(point))))))


(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-leader
  :init
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(use-package evil-snipe
  :after evil
  :ensure t
  :config
  (evil-snipe-override-mode +1)
  )

(provide 'k_evil)
;;; evil.el ends here
