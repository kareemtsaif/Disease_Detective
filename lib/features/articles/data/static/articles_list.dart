import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/features/articles/data/models/article.dart';

final List<Article> articles = [
  Article(
    id: '1',
    title: 'Breast cancer',
    description:
        'Breast cancer is a cancer that forms in the cells of the breast, often causing lumps or changes in shape',
    image: AppImage.diagnosesOne,
    content: _getBreastCancerContent(),
    riskFactors: [
      {
        'title': 'Gender:',
        'description':
            'The risk of breast cancer increases with age, with most cases diagnosed in women over the age of 50. The risk continues to rise as age advances.',
      },
      {
        'title': 'Age:',
        'description':
            'The risk of breast cancer increases with age, with most cases diagnosed in women over the age of 50. The risk continues to rise as age advances.',
      },
      {
        'title': 'Family History:',
        'description':
            'Having a family history of breast cancer, especially if a close relative (mother, sister, or daughter) had breast cancer, increases the risk.',
      },
    ],
  ),
  Article(
    id: '2',
    title: 'Diabetes',
    description:
        'Diabetes is a chronic condition that affects how the body processes blood sugar (glucose)',
    image: AppImage.diagnosesFour,
    content: 'Detailed information about diabetes...',
  ),
  Article(
    id: '3',
    title: 'Skin diseases',
    description: 'Skin diseases are conditions that affect the skin',
    image: AppImage.diagnosesFive,
    content: 'Detailed information about skin diseases...',
  ),
  Article(
    id: '4',
    title: 'Genetic disorders',
    description:
        'Genetic disorders are caused by changes in a person\'s genes or chromosomes',
    image: AppImage.diagnosesSix,
    content: 'Detailed information about genetic disorders...',
  ),
  Article(
    id: '5',
    title: 'Heart disease',
    description:
        'Heart disease refers to various conditions that affect the heart and blood vessels',
    image: AppImage.diagnosesSeven,
    content: 'Detailed information about heart disease...',
  ),
  Article(
    id: '6',
    title: 'Cognitive Disorders',
    description:
        'Cognitive disorders affect thinking, memory, and daily activities',
    image: AppImage.diagnosesEight,
    content: 'Detailed information about cognitive disorders...',
  ),
];

String _getBreastCancerContent() {
  return '''
Breast cancer is a type of cancer that originates in the cells of the breast. While it can occur in both men and women, it is much more common in women. The most common types of breast cancer are invasive ductal carcinoma (IDC) and invasive lobular carcinoma (ILC). Early signs of breast cancer can include the discovery of a lump in the breast, changes in the shape or size of the breast, or changes to the skin of the breast such as redness, thickening, or dimpling.

Risk factors for breast cancer include a family history of the disease, inherited gene mutations (such as BRCA1 and BRCA2), advancing age, hormonal factors, and certain lifestyle factors. For instance, women who are overweight, physically inactive, or consume alcohol may be at higher risk. Hormonal treatments, such as those used for menopause, may also increase the likelihood of developing breast cancer. Breast cancer can also be classified based on its biological characteristics, such as the presence or absence of certain receptors like estrogen receptors (ER) or progesterone receptors (PR). This classification helps to determine the most appropriate treatment options...
''';
}

String buildRiskFactor() {
  return '''

 'Gender:',
 'Women are at a much higher risk of developing breast cancer than men, although men can also develop it, but this is rare.'
 ''';
}
