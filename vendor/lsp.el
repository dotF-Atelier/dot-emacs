;; lsp support
(use-package lsp-mode
  :after evil
  :ensure t
  :hook ((c-mode . lsp)
	 (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-keymap-prefix "C-c l")
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-file-watch-threshold 15000))

(use-package lsp-ui
  :after lsp
  :ensure t
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil
	lsp-ui-doc-delay 0.5)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key evil-normal-state-map (kbd "K") 'lsp-ui-doc-show)
  )
(use-package lsp-ivy
  :after lsp
  :ensure t
  :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs
  :after lsp
  :ensure t
  :commands lsp-treemacs-errors-list)
(use-package company
  :ensure t
  :config
  (global-company-mode)
  )

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :bind (:map yas-minor-mode-map
              ("C-c C-e" . yas-expand))
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (yas-global-mode 1)
  (setq yas-prompt-functions '(yas-dropdown-prompt
                               yas-ido-prompt
                               yas-completing-prompt)))

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
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function
	#'flycheck-display-error-messages-unless-error-list
	flycheck-indication-mode nil
	))
(use-package flycheck-pos-tip
  :ensure t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))


;;; Build system
(defun my-compile-command-bearmake ()
  "Bear make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "bear make "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))
(defun my-compile-command-make ()
  "Make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "make "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))

;; Premake
(defun my-compile-command-premake ()
  "Premake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "premake4 gmake "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-premake ()
  "Premake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cd build && bear make "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))

;; CMake
(defun my-compile-command-cmake ()
  "CMake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=1 "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-cmake ()
  "CMake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake --build build "
  	       (if buffer-file-name
  		   (shell-quote-argument
  		    (file-name-sans-extension buffer-file-name)))))
  (call-interactively 'compile))

;;; Edit
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

;; c,cpp
(setq c-default-style "linux"
      c-basic-offset 4)

;; python
(use-package lsp-pyright
  :after lsp
  :ensure t
  :hook (python-mode . (lambda()
			 (require 'lsp-pyright)
			 (lsp))))

