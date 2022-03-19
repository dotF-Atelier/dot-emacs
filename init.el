;;; init.el --- initialization file

;;; Commentary:
;; emacs startup file --- initialization for Emacs

;;; Code:

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory) user-emacs-directory)
	((boundp 'user-init-directory) user-init-directory)
	(t "~/.emacs.d/")))


;; for loading other config
(defun load-user-file (file)
  "Load a FILE in current use's configuration directory."
  (interactive "f")
  (load-file (expand-file-name file user-init-dir)))

;; config file shortcuts
(defun edcfg-init ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))
(defun edcfg-basic ()
  "Open the basic file."
  (interactive)
  (find-file (expand-file-name "basic.el" user-init-dir)))
(defun edcfg-vendor ()
  "Open the vendor setup file"
  (interactive)
  (cd (expand-file-name "vendor" user-init-dir))
  (call-interactively 'find-file)
  )

(load-user-file "basic.el")
(load-user-file "vendor/evil.el")
(load-user-file "vendor/prog.el")
(load-user-file "vendor/shell.el")
(load-user-file "vendor/org.el")
(load-user-file "vendor/misc.el")

(provide 'init)

;;; init.el ends here
