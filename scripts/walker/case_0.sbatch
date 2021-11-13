#!/bin/bash
#SBATCH --account=def-mtaylor3
#SBATCH -J walk_h0
#SBATCH -o ./slurm/%j.out
#SBATCH -e ./slurm/%j.err
#SBATCH --array=1-5
#SBATCH --gres=gpu:1        # request GPU "generic resource"
#SBATCH --cpus-per-task=6  # maximum CPU cores per GPU request: 6 on Cedar, 16 on Graham.
#SBATCH --mem=84G        # memory per node
#SBATCH --time=0-48:00      # time (DD-HH:MM)
#SBATCH --mail-user=utkarsh75477@gmail.com
#SBATCH --mail-type=FAIL

module load StdEnv/2020
source /home/umishra/simrl/bin/activate

export MUJOCO_GL=osmesa

python -m pisac.run --root_dir=./tmp/case_0 \
--gin_file=pisac/config/pisac.gin \
--gin_bindings=train_pisac.train_eval.domain_name=\'walker\' \
--gin_bindings=train_pisac.train_eval.task_name=\'walk\' \
--gin_bindings=train_pisac.train_eval.action_repeat=2 \
--gin_bindings=train_pisac.train_eval.initial_collect_steps=10000 \
--gin_bindings=train_pisac.train_eval.initial_feature_step=10000 \
--gin_bindings=train_pisac.train_eval.random_seed=$SLURM_ARRAY_TASK_ID 

echo "Program finished"
