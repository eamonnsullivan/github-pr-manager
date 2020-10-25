(require 'clomacs)

(clomacs-defun gprm-pull-request-info
               pull-request-info
               :lib-name "github-pr-manager"
               :namespace eamonnsullivan.github-pr-manager
               :doc "Get information on a Github pull request.")

(defun get-hashmap (response)
    "Get a hashmap from a JSON response"
  (when response
    (let* ((json-object-type 'hash-table)
           (json-array-type 'list)
           (json-key-type 'string)
           (hashmap (json-read-from-string response)))
      hashmap)))

;;;###autoload
(defun gprm-get-info (url)
  (interactive "r")
  (let ((response (gpr-emacs-pull-request-info url))
        (nrepl-sync-request-timeout 30))
    (get-hashmap response)))


(provide 'github-pr-manager)
