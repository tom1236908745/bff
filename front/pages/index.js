import Head from "next/head";
import styles from "../styles/Home.module.css";
import Layout from "../components/layout";
import { useState, useEffect } from "react";
import axios from "axios";

export default function Home() {
  const [contents, setContents] = useState("");
  let list = [];
  useEffect(() => {
    axios
      .get("http://localhost:3001")
      .then(res => {
        setContents(res.data);
      })
      .catch(e => {
        console.log(e);
      });
  }, []);

  for (var i in contents) {
    list.push(
      <li key={i} className={styles.postsIndexItem}>
        {contents[i].content}
      </li>
    );
  }
  return (
    <Layout>
      <div>
        <Head>
          <title>furima</title>
          <meta name="description" content="furima" />
          <link rel="icon" href="/favicon.ico" />
        </Head>

        <main className={`${styles.main} ${styles.postsMain}`}>
          <ul className={styles.postsIndex}>{list}</ul>
        </main>

        <footer className={styles.footer}>@2020 tom1236908745</footer>
      </div>
    </Layout>
  );
}
