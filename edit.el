;;; edit.el --- edit setup

;; undo tree

;;; Commentary:
;;

;;; Code:
(setq indent-tabs-mode nil)
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; tabbar
(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  (centaur-tabs-change-fonts "arial" 120)

  (setq centaur-tabs-style "bar"
	centaur-tabs-set-bar 'left
	;; (setq x-underline-at-descent-line t)
	;; centaur-tabs-set-icons t
	;; centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-cycle-scope 'tabs
	centaur-tabs-set-modified-marker t
	centaur-tabs-modified-marker "*"
	centaur-tabs-set-close-button nil)
  (setq uniquify-separator "/")
  (setq uniquify-buffer-name-style 'forward)
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
      ;; ((not (eq (file-remote-p (buffer-file-name)) nil))
      ;; "Remote")
      ((or (string-equal "*" (substring (buffer-name) 0 1))
	   (memq major-mode '(magit-process-mode
			      magit-status-mode
			      magit-diff-mode
			      magit-log-mode
			      magit-file-mode
			      magit-blob-mode
			      magit-blame-mode)))
       "Emacs")
      ((derived-mode-p 'prog-mode)
       "Editing")
      ((derived-mode-p 'dired-mode)
       "Dired")
      ((memq major-mode '(helpful-mode
			  help-mode))
       "Help")
      ((memq major-mode '(org-mode
			  org-agenda-clockreport-mode
			  org-src-mode
			  org-agenda-mode
			  org-beamer-mode
			  org-indent-mode
			  org-bullets-mode
			  org-cdlatex-mode
			  org-agenda-log-mode
			  diary-mode))
       "OrgMode")
      (t
       (centaur-tabs-get-group-name (current-buffer))))))
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (vterm-mode . centaur-tabs-local-mode)
  (calendar-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  :bind
  ("<leader> t x" . centaur-tabs--kill-this-buffer-dont-ask)
  ("<leader> t h" . centaur-tabs-backward)
  ("<leader> t l" . centaur-tabs-forward)
  ("<leader> t n" . centaur-tabs--create-new-tab)
  ("<leader> t s" . centaur-tabs-counsel-switch-group)
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t p" . centaur-tabs-group-by-projectile-project)
  ("C-c t g" . centaur-tabs-group-buffer-groups))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1)
  (setq undo-tree-auto-save-history t
	undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
  )

(provide 'edit)

;;; edit.el ends here
