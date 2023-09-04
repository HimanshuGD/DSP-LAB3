
function plotMagnitudeSpectrum(filename)
    % Load the audio file
    [signal, fs] = audioread(filename);

    % Compute the FFT
    N = length(signal);
    fft_result = fft(signal);
    fft_magnitude = abs(fft_result(1:N/2+1)); % Take only the positive frequencies
    fft_magnitude_dB = 20 * log10(fft_magnitude); % Convert to dB scale

    % Create the frequency axis
    f = linspace(0, fs/2, N/2+1);

    % Find the index of the peak magnitude (fundamental harmonic)
    [~, peak_index] = max(fft_magnitude);

    % Find the corresponding frequency in Hz
    fundamental_frequency = f(peak_index);

    % Plot the magnitude spectrum
    figure;
    plot(f, fft_magnitude_dB);
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title('Magnitude Spectrum');
    grid on;

    % Display the fundamental frequency
    fprintf('Fundamental Frequency for %s: %.2f Hz\n', filename, fundamental_frequency);
end

% Analyze the piano recording
plotMagnitudeSpectrum('piano1.wav');

% Analyze the trumpet recording
plotMagnitudeSpectrum('trumpet1.wav');

% Analyze the violin recording
plotMagnitudeSpectrum('violin1.wav');

% Analyze the flute recording
plotMagnitudeSpectrum('flute1.wav');
