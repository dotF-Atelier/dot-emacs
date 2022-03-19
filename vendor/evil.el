;;; evil.el --- evil setup
;; Evil mode

;;; Commentary:
;;

;;; Code:

(use-package evil
  :init (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (advice-add 'undo-auto--last-boundary-amalgamating-number
	      :override #'ignore)
  :config (evil-mode 1)
  (define-key evil-normal-state-map "\C-j/" nil)
  (define-key evil-visual-state-map "\C-j/" nil)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-normal-state-map (kbd "C-w C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-w C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-w C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-w C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "gsk") 'avy-goto-word-0-above)
  (define-key evil-normal-state-map (kbd "gsj") 'avy-goto-word-0-below)
  (define-key evil-normal-state-map (kbd "gss") 'avy-goto-char-timer)
  (define-key evil-insert-state-map (kbd "C-u")
    (lambda ()
      (interactive)
      (evil-delete (point-at-bol)
		   (point)))))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))

(use-package evil-leader
  :ensure t
  :config (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(provide 'k_evil)
;;; evil.el ends here
