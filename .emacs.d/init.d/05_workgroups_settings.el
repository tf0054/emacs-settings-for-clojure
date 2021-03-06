(add-to-list 'load-path "~/workgroups/workgroups.el")
(setq wg-prefix-key (kbd "C-c w"))

(defvar window-layout-save-dir "~/.emacs.d/window-purpose")

(require 'window-purpose)
(purpose-mode)
(setq purpose-layout-dirs '("~/.emacs.d/window-purpose"))
(add-to-list 'purpose-user-regexp-purposes '("^\\*scratch\\*$" . sub-2))
(add-to-list 'purpose-user-regexp-purposes '("*magit: .*?*" . main))
(add-to-list 'purpose-user-regexp-purposes '("\\.*.md$" . main))
(add-to-list 'purpose-user-mode-purposes '(emacs-lisp-mode . main))
(add-to-list 'purpose-user-mode-purposes '(clojure-mode . main))
(add-to-list 'purpose-user-mode-purposes '(dired-mode .main))
(add-to-list 'purpose-user-mode-purposes '(html-mode .main))
(add-to-list 'purpose-user-mode-purposes '(fundamental-mode .main))
(add-to-list 'purpose-user-regexp-purposes '("^\\*GNU Emacs\\*$" . main))
(add-to-list 'purpose-user-regexp-purposes '("^\\*eshell\\*$" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("*magit: .*?*""*magit-process: .*?*" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*anything\\*$" . sub-2))
(add-to-list 'purpose-user-regexp-purposes '("^\\*cider-error.*" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*cider-repl.*" . sub-2))
(add-to-list 'purpose-user-regexp-purposes '("^\\*grep*" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*magit-*diff.*" . main))
(add-to-list 'purpose-user-regexp-purposes '("^\\*cider-debug.*" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*Async Shell Command.*$" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*grep\\*$" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^\\*Messages\\*$" . sub-1))
(add-to-list 'purpose-user-regexp-purposes '("^figwheel_server.log$" . sub-1))
(purpose-compile-user-configuration)

(add-hook 'auto-save-hook
	  (lambda ()
            (purpose-save-window-layout "wg01" "~/.emacs.d/window-purpose")))

(add-hook 'kill-emacs-hook
            (lambda ()
              (neotree-hide)
              (purpose-save-window-layout "wg01" "~/.emacs.d/window-purpose")))

(eshell)

;;(require 'workgroups)
;;(workgroups-mode 1)
(if (file-exists-p "~/.emacs.d/window-purpose/wg01.window-layout")
    (progn
      (purpose-load-window-layout "wg01" '("~/.emacs.d/window-purpose"))
            (neotree-show))
  (neotree))


;(require 'switch-window)
; (select-window (third (switch-window--list)))

;; (defun display-main-window (buffer alist)
;;   (window--display-buffer buffer (second (switch-window--list)) 'reuse))
;; (defun display-third-window (buffer alist)
;;   (select-window (nth 2 (switch-window--list)))
;;   (window--display-buffer buffer (nth 2 (switch-window--list)) 'reuse))
;; (defun display-forth-window (buffer alist)
;;   (select-window (nth 3 (switch-window--list)))
;;   (window--display-buffer buffer (nth 3 (switch-window--list)) 'reuse))

;(setq inhibit-startup-screen t)
;; (setq display-buffer-alist
;;       '(("*anything.*?*" . (display-forth-window . nil))
;;         ("*cider.*?*" . (display-forth-window . nil))
;;         ("*cider-error.*?*" . (display-forth-window . nil))
;;         ("*Async Shell Command.*?*" . (display-third-window . nil))
;;         ("*magit: .*?*" . (display-main-window . nil))
;;         ("*magit-process: .*?*" . (display-third-window . nil))
;;         ("*eshell.*?*" . (display-third-window . nil))))

