using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class LogicScript : MonoBehaviour
{
    public int playerScore;
    public Text scoreText;
    public GameObject gameOverScreen;
    public AudioSource dingSFX;
    public AudioSource BGM;

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
        Debug.Log("Game Over");
        gameOverScreen.SetActive(true);
        BGM.Stop();

    }

    public void QuitGame()
    {
        Debug.Log("cliked quit");
        Application.Quit();
    }
}
