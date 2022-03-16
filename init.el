(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current use's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "basic.el")
(load-user-file "vendor/evil.el")
(load-user-file "vendor/lsp.el")
