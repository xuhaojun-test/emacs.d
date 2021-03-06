(require 'util-file)

(require 'server)
(unless (server-running-p)
  (server-start))

;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no splash screen please ... jeez
(setq inhibit-startup-message t)

;; 預設使用zsh
(setq shell-file-name "/bin/zsh")

;; 用一个很大的 kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 300)

;;Use the awesome conkeror to open url's
(setq browse-url-browser-function (quote browse-url-generic))
(setq browse-url-generic-program "firefox")

;;Midle mouse insert X selection by point position.
(setq mouse-yank-at-point t)

;; Clear scratch buffer
(setq initial-scratch-message "")

;;Show line number
(global-linum-mode -1)
(require 'nlinum)
;; (mapcar (lambda (hooksym)
;;           (add-hook hooksym
;;                     (lambda ()
;;                       (nlinum-mode))))
;;         '(cc-mode-hook
;;           c-mode-hook
;;           c++-mode-hook
;;           lisp-mode-hook
;;           emacs-lisp-mode-hook
;;           ))

;;Aviod mouse point when cursor at surround.
;;(mouse-avoidance-mode 'animate)

;; mouse auto focus other window with my thinkpad trackpoint
(setq mouse-autoselect-window t)

;;Not show like "emacs@xxx" title,and set it buffer name.
(setq frame-title-format "emacs@%b")

;;Let emacs can show image.
(auto-image-file-mode)

(setq enable-recursive-minibuffers t)

(setq tab-width 4)

(setq require-final-newline t)

(setq large-file-warning-threshold nil)

(setq default-major-mode 'text-mode)

;; Delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq gc-cons-threshold 20000000)
;;---------------------------------------


;; after copy Ctrl+c in X11 apps, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)

;; after mouse selection in X11, you can paste by `yank' in emacs
(setq x-select-enable-primary t)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Lines should be 80 characters wide, not 72
(setq-default fill-column 80)

;; Undo/redo window configuration with C-c <left>/<right>
(require 'winner)
(winner-mode 1)

;; Never insert tabs
(setq-default indent-tabs-mode nil)

;; Show me empty lines after buffer end
(set-default 'indicate-empty-lines t)

;; Easily navigate sillycased words
(global-subword-mode 1)

;; Don't break lines for me, please
(setq-default truncate-lines t)

;; org-mode: Don't ruin S-arrow to switch windows please (use M-+ and M-- instead to toggle)
(setq org-replace-disputed-keys t)

;; Fontify org-mode code blocks
(setq org-src-fontify-natively t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(require 'undo-tree)
(global-undo-tree-mode)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; A saner ediff
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Nic says eval-expression-print-level needs to be set to nil (turned off) so
;; that you can always see what's happening.
(setq eval-expression-print-level nil)

;; When popping the mark, continue popping until the cursor actually moves
;; Also, if the last command was a copy - skip past all the expand-region cruft.
;; (defadvice pop-to-mark-command (around ensure-new-position activate)
;;   (let ((p (point)))
;;     (when (eq last-command 'save-region-or-current-line)
;;       ad-do-it
;;       ad-do-it
;;       ad-do-it)
;;     (dotimes (i 10)
;;       (when (= p (point)) ad-do-it))))

(provide 'sane-defaults)
