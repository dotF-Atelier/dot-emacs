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

(load-user-file "basic.el")
(load-user-file "vendor/evil.el")
(load-user-file "vendor/prog.el")
(load-user-file "vendor/shell.el")
(load-user-file "vendor/org.el")
(load-user-file "vendor/misc.el")

(provide 'init)

;;; init.el ends here
