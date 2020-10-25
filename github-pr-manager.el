(require 'clomacs)

(clomacs-defun gprm-pull-request-info
               pull-request-info
               :lib-name "github-pr-manager"
               :namespace eamonnsullivan.github-pr-manager
               :doc "Get information on a Github pull request.")

(clomacs-defun gprm-add-pull-request-comment
               add-comment
               :lib-name "github-pr-manager"
               :namespace eamonnsullivan.github-pr-manager
               :doc "Add a comment to a github pull request.")

(defun get-hashmap (response)
  "Get a hashmap from a JSON response"
  (when response
    (let* ((json-object-type 'hash-table)
           (json-array-type 'list)
           (json-key-type 'string)
           (hashmap (json-read-from-string response)))
      hashmap)))

(defun gprm-get-info (url)
  "Get information, the form of a hashmap, for a particular pull request."
  (interactive "r")
  (let ((response (gprm-pull-request-info url))
        (nrepl-sync-request-timeout 30))
    (get-hashmap response)))

(defun gprm-add-comment (url comment)
  "Add a comment to a pull request."
  (interactive "p")
  (let ((response (gprm-pull-request-comment url comment))
        (nrepl-sync-request-timeout 30))
    (get-hashmap response)))

(provide 'github-pr-manager)
