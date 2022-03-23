;;; prog.el --- programming support

;;; Commentary:
;;

;;; Code:

;; lsp support
(use-package lsp-mode
  :after evil
  :ensure t
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
	 (python-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 15000)
  :bind-keymap
  ("C-c l" . lsp-command-map)
  )

(use-package lsp-ui
  :after lsp
  :ensure t
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil
	lsp-ui-doc-delay 0.5)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)
	([remap xref-find-references] . #'lsp-ui-peek-find-references))
  (:map evil-normal-state-map("K" . 'lsp-ui-doc-show)))

(use-package lsp-ivy
  :after lsp
  :ensure t
  :commands lsp-ivy-workspace-symbol
  )

(use-package ivy-prescient
  :config (ivy-prescient-mode 1))

(use-package lsp-treemacs
  :after lsp
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-show-numbers t)
  )

(use-package company-prescient
  :after company
  :config (company-prescient-mode t))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind
  (:map yas-minor-mode-map
	      ("C-c C-e" . yas-expand))
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  ;; (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-dropdown-prompt yas-ido-prompt yas-completing-prompt)))
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; cmake
(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :hook (cmake-mode . lsp-deferred))

(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :config (cmake-font-lock-activate))

;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list
	flycheck-indication-mode nil))
(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config (flycheck-pos-tip-mode))

;; Projectile
(use-package projectile
  :config (projectile-mode)
  :bind
  (:map evil-normal-state-map
	 ("<leader>p" . 'projectile-command-map))
  )

;; c,cpp
(setq c-default-style "linux" c-basic-offset 4)

;; gdb configuration
(setq gdb-many-windows t
      gdb-show-main t)

;; python
(use-package lsp-pyright
  :after lsp
  :ensure t
  :hook (python-mode . (lambda()
			 (require 'lsp-pyright)
			 (lsp))))

(provide 'k_prog)
;;; prog.el ends here
