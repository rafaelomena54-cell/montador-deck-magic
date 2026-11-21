package com.rafaelomena.deckmagic;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebSettings;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        WebView navegador = new WebView(this);

        WebSettings configuracoes = navegador.getSettings();
        configuracoes.setJavaScriptEnabled(true);
        configuracoes.setDomStorageEnabled(true);

        navegador.setWebViewClient(new WebViewClient());

        setContentView(navegador);

        navegador.loadUrl("https://montador-deck-magic.onrender.com/");
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
    }
}
