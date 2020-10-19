(ns eamonnsullivan.gpr-emacs
  (:require [eamonnsullivan.github-pr-lib :as pr]
            [clojure.data.json :as json]))

(def access-token (System/getenv "GITHUB_ACCESS_TOKEN"))

(defn pull-request-info
  [pull-request-url]
  (json/write-str
   (pr/get-pull-request-info access-token
                             pull-request-url)))
