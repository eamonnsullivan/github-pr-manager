(require 'clomacs)

(clomacs-defun gpr-emacs-pull-request-info
               pull-request-info
               :lib-name "gpr-emacs"
               :namespace eamonnsullivan.gpr-emacs
               :doc "Get information on a Github pull request.")

(defun gpr-emacs-get-info (url)
  (interactive "r")
  (let ((response (gpr-emacs-pull-request-info url))
        (nrepl-sync-request-timeout 30))
    (when response
      (let* ((json-object-type 'hash-table)
             (json-array-type 'list)
             (json-key-type 'string)
             (json (json-read-from-string response)))
        json))))

(provide 'gpr-emacs)
