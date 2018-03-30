;; .emacs

(add-to-list 'load-path "~/.emacs.d/lisp/")

(autoload 'gid "id-utils" nil t)
(global-set-key "\M-g" 'gid)

;(require 'xclip)
;(turn-on-xclip)

(require 'fill-column-indicator)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda () (fci-mode 1)))
(global-fci-mode 1)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(setq-default fill-column 80)
(set-fill-column 80)
(setq-default fci-column 80)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward uniquify-separator ":")

;; use sane indentation
(setq c-default-style "ellemtel" c-basic-offset 2)
(setq-default indent-tabs-mode nil)

;; show trailing whitespace in red
(setq-default show-trailing-whitespace t)

;; match parens with %
(defun ws-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun ws-scroll-up ()
  (interactive)
  (scroll-up 1)
  (next-line 1)
  )

(defun ws-scroll-down ()
  (interactive)
  (scroll-down 1)
  (previous-line 1)
  )

(defun ws-show-and-copy-file-name ()
  "Show the full path file name in the minibuffer and copy to clipboard"
  (interactive)
  (message (buffer-file-name))
  (kill-new buffer-file-name)
  )

(defun ws-vc-version-diff-origin-master ()
  (interactive)
  (vc-version-diff buffer-file-name "origin/master" nil)
)

(defun ws-vc-version-diff-origin-branch ()
  (interactive)
  (let ((branch (read-string "Enter branch name:")))
    (vc-version-diff buffer-file-name branch nil))
)

(defun ws-revert-buffer ()
  "revert buffer without confirmaiton"
  (interactive)
  (revert-buffer t t)
  )

(defun ws-indent-and-advance ()
  "c-indent-line-or-region and advance to next line"
  (interactive)
  (c-indent-line-or-region)
  (next-line 1)
  )

(global-set-key "%" 'ws-match-paren)
(global-set-key "\M-n" 'ws-scroll-up)
(global-set-key "\M-p" 'ws-scroll-down)
(global-set-key (kbd "<f5>") 'ws-revert-buffer)
(global-set-key (kbd "<f6>") 'ws-indent-and-advance)

;; my very own keymap!
(setq ws-map (make-sparse-keymap))
(define-key global-map "\C-cw" ws-map)
(define-key ws-map "l" 'goto-line)
(define-key ws-map "t" 'toggle-truncate-lines)
(define-key ws-map "k" 'keep-lines)
(define-key ws-map "f" 'follow-switch-to-buffer-all)
(define-key ws-map "w" 'ws-show-and-copy-file-name)
(define-key ws-map "i" 'overwrite-mode)
(define-key global-map "\C-xv " 'ws-vc-version-diff-origin-master)
(define-key global-map "\C-xvm" 'ws-vc-version-diff-origin-branch)

;; other preferences
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq diff-switches "-x -w")
(setq column-number-mode t)
(which-func-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-default-style "k&r" t)
 '(ediff-split-window-function (quote split-window-horizontally))
 '(menu-bar-mode nil)
 '(sh-basic-offset 2)
 '(sh-indentation 2)
 '(split-height-threshold nil)
 '(split-width-threshold 240))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:inherit diff-changed :foreground "dark green" :weight normal))))
 '(diff-file-header ((((class color) (background light)) (:foreground "orange" :weight normal))))
 '(diff-function ((t (:inherit diff-header :foreground "purple" :weight bold))))
 '(diff-header ((((class color) (background light)) (:foreground "blue" :weight normal))))
 '(diff-removed ((t (:inherit diff-changed :foreground "dark red" :weight normal))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black" x:weight bold))))
 '(lazy-highlight ((((class color) (min-colors 8)) (:background "gray")))))

(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; end of fil
