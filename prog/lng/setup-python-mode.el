;;; Require package: (jedi)

(require 'python)
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
(setq python-python-command "/usr/bin/python")
;; (setq-default py-indent-offset 2)

;; need install jedi and epc from pip
(require 'jedi)
(autoload 'jedi:setup "jedi" nil t)
(setq jedi:server-command
      (list "/usr/bin/python" jedi:server-script))
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook 'jedi:ac-setup)

;; Syntax check by flycheck-mode depend extern flake8 or pylint.
;; (add-hook 'python-mode-hook 'flycheck-mode)

(provide 'setup-python-mode)
