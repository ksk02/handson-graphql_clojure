(ns clojure-graphql.main
  (:gen-class)
  (:require [duct.core :as duct]))

(duct/load-hierarchy)

(defn -main [& args]
  (let [keys     (or (duct/parse-keys args) [:duct/daemon])
        profiles [:duct.profile/prod]]
    (-> (duct/resource "clojure_graphql/config.edn")
        (duct/read-config)
        (duct/exec-config profiles keys))
    (System/exit 0)))
