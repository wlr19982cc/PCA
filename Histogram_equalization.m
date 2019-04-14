function output_img = Histogram_equalization(input_img, L)

	[dim1, dim2, ~] = size(input_img);
	num_pixels = dim1 * dim2;
    output_img = input_img;
    % Calculate the histogram of the original
    freq = zeros(L, 1);
	for i = 1:dim1
	    for j = 1:dim2
	        value = input_img(i, j);
	        freq(value + 1) = freq(value + 1) + 1;
	    end
    end
    % Calculate the progressive probability
	probality = freq / num_pixels;
	probality_s = zeros(L, 1);
	p = 0;
	for i = 1:L
	    p = p + probality(i);
	    probality_s(i) = round((L - 1) * p);
    end
    % Calculate the output histogram
	for i = 1:dim1
	    for j = 1:dim2
	        value = input_img(i, j);
	        output_img(i, j) = probality_s(value + 1);
	    end
    end
end
