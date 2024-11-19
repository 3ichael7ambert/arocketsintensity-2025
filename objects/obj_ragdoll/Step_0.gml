if fps_real > 200{
    rag_max = 500;
}else if fps_real < 300 && fps_real > 100{
    rag_max = 50
}else if fps_real <= 60{
    rag_max = 30;
}
