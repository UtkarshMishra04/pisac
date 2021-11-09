python -m pisac.run --root_dir=/tmp/abc \
--gin_file=pisac/config/pisac.gin \
--gin_bindings=train_pisac.train_eval.domain_name=\'$1\' \
--gin_bindings=train_pisac.train_eval.task_name=\'$2\' \
--gin_bindings=train_pisac.train_eval.action_repeat=4 \
--gin_bindings=train_pisac.train_eval.initial_collect_steps=10000 \
--gin_bindings=train_pisac.train_eval.initial_feature_step=10000 \
--gin_bindings=train_pisac.train_eval.random_seed=1
