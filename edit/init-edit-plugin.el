(add-to-list 'load-path (concat user-emacs-directory "edit/evil"))
(require 'setup-evil-init)

(require 'setup-undo-tree)
(require 'setup-ace-jump-buffer)
(require 'setup-smartparens)
(require 'setup-ack-and-a-half)
(require 'setup-ag)
(require 'setup-autopair)
(require 'setup-browse-kill-ring)
(require 'setup-wgrep)
(require 'setup-flex-isearch)

(require 'visual-regexp)
(require 'expand-region)
(require 'color-moccur)
(require 'moccur-edit)

(require 'indent-file)
(require 'util-indent)
;; (add-hook 'emacs-lisp-mode-hook 'indent-file-when-save)
;; (add-hook 'scheme-mode-hook 'indent-file-when-save)
;; (add-hook 'lisp-mode-hook 'indent-file-when-save)
;; (add-hook 'c-mode-common-hook 'indent-file-when-save)

(provide 'init-edit-plugin)
