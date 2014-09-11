;; I hate tabs! http://emacsblog.org/2007/09/30/quick-tip-spaces-instead-of-tabs/
(setq-default indent-tabs-mode nil)

;; Use clipboard properly
(setq x-select-enable-clipboard t)

;; Quoted-insert to the rescue. Type C-q C-i to insert a horizontal tab character

;; Erlang mode
(push "/opt/erlang/R16B03-1/lib/tools-2.6.13/emacs/" load-path)
(require 'erlang-start)

;; Flymake for erlang
;;(require 'erlang-flymake)
;;
;; http://www.emacswiki.org/emacs/FlyMake#toc19
;;  (defun flymake-next-error()
;;    (interactive)
;;    (flymake-goto-next-error)
;;    (flymake-display-err-menu-for-current-line)
;;    )
;;  (local-set-key "\C-c\C-v" 'flymake-next-error)

;; Show column number
(column-number-mode 1)

;; Make trailing whitespace red and anything wider than 80 columns black
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;; Distel
;;(add-to-list 'load-path "/usr/local/share/distel/elisp")
;;(require 'distel)
;;(distel-setup)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((allout-layout . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups




(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("elpa" . "http://elpa.gnu.org/packages/")))

(add-hook 'after-init-hook 'edts-load-after-init-hook)
(defun edts-load-after-init-hook ()
  (require 'edts-start))

(global-set-key [S-dead-grave S-dead-grave] "`")
(global-set-key [dead-acute dead-acute] "´")
(global-set-key [dead-tilde dead-tilde] "~")
(global-set-key [S-dead-circumflex S-dead-circumflex] "^")
