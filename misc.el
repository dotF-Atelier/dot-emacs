;;; misc.el --- misc file

;;; Commentary:
;;

;; config file shortcuts
(defun edit-emacs-config ()
  "Open the emacs configuration file"
  (interactive)
  (cd user-emacs-directory)
  (call-interactively 'find-file)
  )
(evil-leader/set-key "ec" 'edit-emacs-config)

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

;; Premake
(defun my-compile-command-premake ()
  "Premake compile command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "premake4 gmake " (if buffer-file-name (shell-quote-argument
						       (file-name-sans-extension
							buffer-file-name)))))
  (call-interactively 'compile))
(defun my-build-command-premake ()
  "Premake build command."
  (interactive)
  (set (make-local-variable 'compile-command)
       (concat "cd build && bear make " (if buffer-file-name (shell-quote-argument
							      (file-name-sans-extension
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


(provide 'misc)

;;; misc.el ends here
