;; Define the init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name (concat user-emacs-directory "backups")))))
;; Don't clutter with #files either
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name (concat user-emacs-directory
									"backups")))))

;; Define and initialise package repositories
(require 'package)
(add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; use-package to simplify the config file
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure 't)

;; basic setting
(setq inhibit-startup-message t)
(setq use-dialog-box nil)
(setq truncate-partial-width-windows nil)
(tool-bar-mode -1)			; Disable the toolbar
(tooltip-mode -1)			; Disable tooltips
(menu-bar-mode -1)			; Disable the menu bar
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)

(global-linum-mode)
(recentf-mode 1)
(set-default 'truncate-lines t)
(savehist-mode)

;; Fonts
(add-to-list 'default-frame-alist '(font . "fantasquesansmono-13"))

(use-package all-the-icons
  :custom
  (inhibit-compacting-font-caches t)
  (all-the-icons-scale-factor 1.0)
  )

;; Themes
(use-package
  doom-themes
  :config (load-theme 'doom-horizon t))

;; Modeline
(use-package
  doom-modeline
  :config (doom-modeline-mode))

;; which key
(use-package
  which-key
  :config (which-key-mode))

;; counsel
(use-package
  counsel
  :custom
  (counsel-find-file-ignore-regexp (concat
					 ;; File names beginning with # or .
					 "\\(?:\\`[#.]\\)"
					 ;; File names ending with # or ~
					 "\\|\\(?:\\`.+?[#~]\\'\\)"))
  (ivy-extra-directories nil)
  (recentf-max-menu-items 25)
  (recentf-max-saved-items 25)
  :config
  (counsel-mode)
  (ivy-mode)
  :bind
  ("C-s" . 'swiper)
  ("C-c C-r" . 'ivy-resume)
  ("C-x C-r" . 'counsel-recentf)
  ("C-x C-b" . 'ibuffer)
  ("C-x b" . 'counsel-ibuffer)
  )

(use-package amx
  :config
  (amx-mode))

(provide 'k_basic)
;;; basic.el ends here
