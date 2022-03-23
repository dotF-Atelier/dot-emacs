;;; misc.el --- misc file

;;; Commentary:
;;

;; config file shortcuts
(defun edit-emacs-config ()
  "Open the emacs configuration file"
  (interactive)
  (call-interactively (counsel-find-file "~/.emacs.d")))
(evil-define-key 'normal 'global (kbd "<leader>ec") 'edit-emacs-config)

;;; Build system
(defun my-compile-command-bearmake ()
  "Bear make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "bear make " (if buffer-file-name (shell-quote-argument (file-name-sans-extension
									buffer-file-name)))))
  (call-interactively 'compile))
(defun my-compile-command-make ()
  "Make compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "make " (if buffer-file-name (shell-quote-argument (file-name-sans-extension
								   buffer-file-name)))))
  (call-interactively 'compile))

;; CMake
(defun my-compile-command-cmake ()
  "CMake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake -H. -Bbuild -DCMAKE_EXPORT_COMPILE_COMMANDS=1 " (if buffer-file-name
									  (shell-quote-argument
									   (file-name-sans-extension
									    buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-cmake ()
  "CMake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cmake --build build " (if buffer-file-name (shell-quote-argument
							    (file-name-sans-extension
							     buffer-file-name)))))
  (call-interactively 'compile))

(evil-define-key 'normal 'global (kbd "<leader>cr") 'my-compile-command-bearmake)
(evil-define-key 'normal 'global (kbd "<leader>cm") 'my-compile-command-make)
(evil-define-key 'normal 'global (kbd "<leader>cc") 'my-compile-command-cmake)
(evil-define-key 'normal 'global (kbd "<leader>cb") 'my-build-command-cmake)


(provide 'misc)

;;; misc.el ends here
