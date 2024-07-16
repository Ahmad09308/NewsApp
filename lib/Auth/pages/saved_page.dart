import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('The Next Technological Revolution'),
              background: Image.asset(
                'assets/t.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Card(
                  child: ListTile(
                    title: Text(
                        'Artificial Intelligence: The Next Technological Revolution'),
                    subtitle: Text(
                        "In recent years, the world has witnessed a tremendous evolution in the field of technology, with artificial intelligence (AI) being at the forefront of this revolution. AI is not just a futuristic concept but a reality that is transforming industries and everyday life. From healthcare to finance, transportation to education, AI's impact is profound and far-reaching.Transforming IndustriesAI is revolutionizing various industries by automating tasks, improving efficiency, and providing insights through data analysis. In healthcare, AI algorithms can analyze medical images faster and more accurately than human doctors, leading to early detection of diseases and better patient outcomes. In finance, AI is used for fraud detection, risk management, and personalized banking experiences.Everyday ApplicationsBeyond industries, AI has become an integral part of our daily lives. Virtual assistants like Siri, Alexa, and Google Assistant use AI to understand and respond to our commands. Recommendation systems on platforms like Netflix and Amazon use AI to suggest content and products based on our preferences. Autonomous vehicles, powered by AI, are being developed to make transportation safer and more efficient.Ethical and Social ConsiderationsDespite its many benefits, AI also raises ethical and social concerns. Issues such as data privacy, job displacement, and algorithmic bias need to be addressed to ensure the responsible use of AI. Policymakers, technologists, and society at large must work together to create regulations and frameworks that balance innovation with ethical considerations.The Future of AIThe future of AI holds even more exciting possibilities. Advancements in machine learning, natural language processing, and robotics will continue to push the boundaries of what AI can achieve. As AI becomes more integrated into various aspects of life, it is crucial to foster an environment of innovation while addressing the challenges that come with it.In conclusion, artificial intelligence is not just a technological advancement; it is a transformative force that is reshaping our world. By embracing AI and addressing its challenges, we can harness its full potential to create a better, more efficient, and equitable future."),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
