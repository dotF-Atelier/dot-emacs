;;; +prog.el -*- lexical-binding: t; -*-
;;;

;; disable snipe mode
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(after! company
  (setq company-idle-delay 0.1)
  (setq company-format-margin-function #'company-detect-icons-margin))

(add-to-list 'auto-mode-alist '("\\.inl\\'" . +cc-c-c++-objc-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . +cc-c-c++-objc-mode))

;; lsp
(setq +format-with-lsp nil)
(after! lsp-mode
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024)
        company-idle-delay 0.0
        company-minimum-prefix-length 1
        lsp-idle-delay 0.1)
  (setq lsp-headerline-breadcrumb-enable t
        lsp-headerline-breadcrumb-icons-enable nil
        lsp-file-watch-threshold 4000
        lsp-log-io nil
        lsp-headerline-breadcrumb-segments '(file symbols)
        lsp-imenu-index-symbol-kinds '(File Module Namespace Package Class Method Enum Interface
                                       Function Variable Constant Struct Event Operator TypeParameter)
        )
  (dolist (dir '("[/\\\\]\\.ccls-cache\\'"
                 "[/\\\\]\\.mypy_cache\\'"
                 "[/\\\\]\\.pytest_cache\\'"
                 "[/\\\\]\\.cache\\'"
                 "[/\\\\]\\.clwb\\'"
                 "[/\\\\]__pycache__\\'"
                 "[/\\\\]bazel-bin\\'"
                 "[/\\\\]bazel-code\\'"
                 "[/\\\\]bazel-genfiles\\'"
                 "[/\\\\]bazel-out\\'"
                 "[/\\\\]bazel-testlogs\\'"
                 "[/\\\\]third_party\\'"
                 "[/\\\\]third-party\\'"
                 "[/\\\\]buildtools\\'"
                 "[/\\\\]out\\'"
                 "[/\\\\]external\\'"
                 ))
    (push dir lsp-file-watch-ignored-directories))
  (setq lsp-clients-clangd-args '("-j=8"
                                  "--all-scopes-completion"
                                  "--clang-tidy"
                                  "--enable-config"
                                  "--background-index"
                                  "--completion-style=bundled"
                                  "--pch-storage=memory"
                                  "--header-insertion=never"
                                  "--log=verbose"
                                  "--header-insertion-decorators=0"
                                  ))
  )

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-lens-enable t
        lsp-ui-sideline-enable t
        lsp-ui-doc-include-signature t
        lsp-ui-doc-max-height 15
        lsp-ui-doc-max-width 100))

(add-to-list 'auto-mode-alist '("\\.comp\\'" . glsl-mode))

(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(add-hook 'prog-mode-hook #'yas-minor-mode)
;; projectile
(setq projectile-project-root-functions '(projectile-root-local
                                          projectile-root-top-down
                                          projectile-root-top-down-recurring
                                          projectile-root-bottom-up))
(setq projectile-globally-ignored-directories '("build"))

(setq vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=yes")

(c-set-offset 'inline-open '0)
(defun vlad-cc-style()
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'access-label '/)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  )

(after! dap-mode
        (dap-register-debug-template
        "GDB::Run MB async compute"
        (list :type "gdb"
                :request "launch"
                :name "GDB::Run MB async compute"
                :arguments "-Tests AsyncCompute"
                :target "/home/kingstom/workspaces/Microbench/build/microbench/microbench"
                :cwd "/home/kingstom/workspaces/Microbench/build/microbench"))

        (dap-register-debug-template
        "GDB::Run MB"
        (list :type "gdb"
                :request "launch"
                :name "GDB::Run MB"
                :target "/home/kingstom/workspaces/Microbench/build/microbench/microbench"
                :cwd "/home/kingstom/workspaces/Microbench/build/microbench"))
  )

(add-hook 'c++-mode-hook 'vlad-cc-style)
