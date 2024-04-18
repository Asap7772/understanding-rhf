lr_list=(0.01)
#train_states_list=(5 10 20 50 100 200 500 1000)
train_states_list=(10)
#beta_values=(1.0 2.0 5.0 10.0 20.0 50.0 100.0)
beta_values=(10.0)
algorithm="ipo"
reward_functions=(5)
epoch_list=(100)
N_values=(10)
num_inner_iterations=(15)
policy='categorical'
num_action_dim=1
num_actions=100
action_type='discrete'
seeds=(1 2 3 4 5)



for reward_function in "${reward_functions[@]}"; do
for lr in "${lr_list[@]}"; do
for train_state in "${train_states_list[@]}"; do
for epochs in "${epoch_list[@]}"; do
for N in "${N_values[@]}"; do
for num_iterations in "${num_inner_iterations[@]}"; do
for beta in "${beta_values[@]}"; do
for seed in "${seeds[@]}"; do
    project_name=discrete_1d_onpolicy_fixed_databudget_final_reward_function_${reward_function}
    filedir=discrete_1d_onpolicy_fixed_databudget_final_reward_function_${reward_function}

    command="python hyperparam_tuning.py --algorithm $algorithm \
        --reward_function $reward_function \
        --epochs $epochs \
        --N $N \
        --num_iterations_on_same_samples $num_iterations \
        --filedir $filedir \
        --lr $lr \
        --policy $policy \
        --num_action_dim $num_action_dim \
        --num_actions $num_actions \
        --action_type $action_type \
        --should_integrate_wandb \
        --project_name $project_name \
        --num_train_states $train_state \
        --beta $beta \
        --seed $seed \
    "
    echo -e "$command\n"
    eval $command
done
done
done
done
done
done
done
done
