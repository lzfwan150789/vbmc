clear;
%cd ~/Code/GP/BQR
% 


prob_bqr_incr_samples;

% load test_bqr_incr_samples_slice
% f = isnan(prod(MC,2));
% BQR(f,:) = [];BQ(f,:)=[];BMC(f,:)=[];MC(f,:)=[];
        
% samples = slicesample(prior.means, max_num_samples,'pdf', p_r_fn,'width', prior.sds);
% 
%     clf;hold on;
% ezplot(@(x) p_r_fn(x));
% ff=[];qq=[];for i=1:max_num_samples;ff(i)=p_r_fn(samples(i));qq(i)=q_fn(samples(i));end;
% plot(samples,ff,'b.','MarkerSize',5)
% plot(samples,qq,'r.','MarkerSize',5)
% axis tight
% 
% figure
% histfit(samples,50)
% h = get(gca,'Children');
% set(h(2),'FaceColor',[.8 .8 1])


ML = [];

q = [];
r = [];
for trial = (size(ML,1)+1):max_trials
    fprintf('trial = %u\n', trial);
    
    ML = [ML;nan(1, max_num_samples)];
    
    samples = slicesample(prior.means, max_num_samples,...
        'pdf', p_r_fn,'width', prior.sds);

    q= [];
    r= [];
    gpq = [];
    gpr = [];
    for num_sample = 1:max_num_samples;
        fprintf('%g,',num_sample);
           
        % structs for q and r no longer reqd
        q = [q;q_fn(samples(num_sample,:))];
        r = [r;r_fn(samples(num_sample,:))];
        
        sample_struct.samples = samples(1:num_sample,:);
        sample_struct.log_r = log(r);
        sample_struct.q = q;
        
%         [r_noise_sd, r_input_scales, r_output_scale] = ...
%             hp_heuristics(samples, r, 100);


%         gpq = train_gp('sqdexp', 'constant', gpq, ...
%             samples(1:num_sample,:), q, opt);
%         [best_hypersample, best_hypersample_struct] = disp_hyperparams(gpq);
%         
%         q_gp.quad_output_scale = best_hypersample_struct.output_scale;
%         q_gp.quad_input_scales = best_hypersample_struct.input_scales;
%         q_gp.quad_noise_sd = best_hypersample_struct.noise_sd;
%         q_gp.quad_mean = best_hypersample_struct.mean;
%         
%         gpr = train_gp('sqdexp', 'constant', gpr, ...
%             samples(1:num_sample,:), r, opt);
%         [best_hypersample, best_hypersample_struct] = disp_hyperparams(gpr);
%         
%         r_gp.quad_output_scale = best_hypersample_struct.output_scale;
%         r_gp.quad_input_scales = best_hypersample_struct.input_scales;
%         r_gp.quad_noise_sd = best_hypersample_struct.noise_sd;
%         r_gp.quad_mean = best_hypersample_struct.mean;
%    
%         [BQR(trial,num_sample), dummy, BQ(trial,num_sample)] = ...
%             predict(sample_struct, prior, r_gp, q_gp);
%                 
%         BMC(trial,num_sample) = predict_BMC(sample_struct, prior, r_gp, q_gp);
%         
        ML(trial,num_sample) = predict_ML(sample_struct, prior);
        
        
    end
    save test_bqr_incr_samples_slice_incl_ML

    
    %for 
            i = trial;

        perf_ML= sqrt(((ML(i,end) - exact).^2))
    
%         figure;hold on;
%         plot(exact+0*MC(i,:),'k')
%         plot(BQR(i,:),'r')
%         plot(BMC(i,:),'b')
%         plot(MC(i,:),'m')

    %end
            
%         f = all(~isnan(MC'))';
%     
%     
%             figure;hold on;
%         plot(exact+0*MC(1,:),'k')
%         plot(mean(BQR(f,:)),'r')
%         plot(mean(BMC(f,:)),'b')
%         plot(mean(MC(f,:)),'m')
%     
    
    fprintf('\n');
end

rmse = @(X) sqrt(mean((X(:) - exact).^2));

        perf_ML = rmse(ML(:,50:end))

