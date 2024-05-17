using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using UnityEngine.Events;

[System.Serializable]
public class PlayerEvent : UnityEvent
{
}
public class LogicScript : MonoBehaviour
{
    public int playerScore;
    public Text scoreText;
    public GameObject gameOverScreen;
    public AudioSource dingSFX;
    public AudioSource BGM;
    public UnityEvent onPlayerPassedThroughPipe;
    public PlayerEvent onPlayerDied;

    void Start()
    {
        // Initialize the UnityEvent if it's not already assigned
        if (onPlayerPassedThroughPipe == null)
        {
            onPlayerPassedThroughPipe = new UnityEvent();
        }

        if (onPlayerDied == null)
        {
            onPlayerDied = new PlayerEvent();
        }
    }

    [ContextMenu("Increase Score")]
    public void AddScore(int scoretoAdd)
    {
        playerScore += scoretoAdd;
        scoreText.text = playerScore.ToString();
        dingSFX.Play();
    }

    public void RestartGame()
    {
        Debug.Log("clicked restart");
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }

    public void GameOver()
    {
        // Debug.Log("Game Over");
        gameOverScreen.SetActive(true);
        BGM.Stop();

    }

    public void QuitGame()
    {
        Debug.Log("clicked quit");
        Application.Quit();
    }
}
