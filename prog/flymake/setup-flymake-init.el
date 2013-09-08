(require 'flymake)

(require 'setup-flymake-basic)

;; (eval-after-load 'flymake '(require 'setup-flymake-clang))
(add-hook 'c++-mode-hook 'flymake-mode)

(require 'setup-flymake-tex)

;; need install pyflakes from pip
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(require 'helm-flymake)

(provide 'setup-flymake-init)
