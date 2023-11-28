function rnk = helper_rankorder(xs)
xs = xs(:);
% Sort data
[srt, idxSrt]  = sort(xs);
% Find where are the repetitions
idxRepeat = [false; diff(srt) == 0];
% Rank with tieds but w/o skipping
rnkNoSkip = cumsum(~idxRepeat);
% Preallocate rank
rnk = 1:numel(xs);
% Adjust for tieds (and skip)
rnk(idxRepeat) = rnkNoSkip(idxRepeat);
% Sort back
rnk(idxSrt)    = rnk;
rnk = rnk(:);
end