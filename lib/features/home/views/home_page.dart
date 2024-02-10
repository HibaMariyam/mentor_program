import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_program/features/home/widgets/course_card.dart';
import 'package:mentor_program/features/home/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeFailure) {
            return Center(child: Text('Error'));
          }
          if (state is HomeLoaded) {
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeCubit>().getHomeData();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find Your',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(

                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Perfect Mentor',
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 15),
                  Container(
  height: 130, 
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ListViewCard(),
        ListViewCard(),
      ],
    ),
  ),
),

                      SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: Color.fromARGB(242, 231, 230, 230),
                        ),
                        child: TextField(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                        Expanded(
                          child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                 TabBar(
                                  dividerColor: Colors.transparent,
                                    tabs: [
                                      Tab(
                                        text: 'Professional Mentors',
                                      ),
                                      Tab(text: 'Student Mentors'),
                                    ],
                                  ),
                                
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: TabBarView(
                                      children: [
        
                                        GridView(
                                         
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.85,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                          ),
                                       
                                          children: [
                                          for (var course in state.courses)
                                            if(!course.mentor.isStudent)
                                              CourseCard(
                                                course: course,
                                              )
                                          ],
                                        ),
                                        GridView(
                                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                           childAspectRatio: 0.85,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                          ),
                                          children: [
                                            for (var course in state.courses)
                                            if (course.mentor.isStudent)
                                              CourseCard(
                                                course: course,
                                              )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 27,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ListViewCard extends StatelessWidget {
  const ListViewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
     
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
           ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Text('Want to be a mentor?',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              SizedBox(height: 5,),
             ElevatedButton(onPressed: (){}, child:  Text('Add your course',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold)
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)
                )
              ),
              )
            ],
          ),
        )
      ),
    );
  }
}
