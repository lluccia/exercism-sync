<?php
declare(strict_types=1);

class HighScores
{
    public $scores;
    public $latest;
    public $personalBest;
    public $personalTopThree;

    public function __construct(array $scores)
    {
        $this->scores = $scores;
        $this->latest = $scores[count($scores) - 1];

        $sortedScores = $scores;
        rsort($sortedScores);

        $this->personalBest = $sortedScores[0];
        $this->personalTopThree = array_slice($sortedScores, 0, 3);
    }
}
