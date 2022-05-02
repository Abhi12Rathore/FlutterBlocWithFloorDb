// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserData` (`userId` INTEGER PRIMARY KEY AUTOINCREMENT, `userName` TEXT, `emailId` TEXT, `profileImg` TEXT, `accountDetails` TEXT, `cardsList` TEXT, `recipientList` TEXT, `transactionList` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userDataInsertionAdapter = InsertionAdapter(
            database,
            'UserData',
            (UserData item) => <String, Object?>{
                  'userId': item.userId,
                  'userName': item.userName,
                  'emailId': item.emailId,
                  'profileImg': item.profileImg,
                  'accountDetails':
                      _accountDetailsConverter.encode(item.accountDetails),
                  'cardsList': _cardListConverter.encode(item.cardsList),
                  'recipientList':
                      _recipientListConverter.encode(item.recipientList),
                  'transactionList':
                      _transactionListConverter.encode(item.transactionList)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserData> _userDataInsertionAdapter;

  @override
  Future<UserData?> fetchUserData() async {
    return _queryAdapter.query('SELECT * FROM UserData',
        mapper: (Map<String, Object?> row) => UserData(
            row['userId'] as int?,
            row['userName'] as String?,
            row['emailId'] as String?,
            _accountDetailsConverter.decode(row['accountDetails'] as String),
            _cardListConverter.decode(row['cardsList'] as String),
            _recipientListConverter.decode(row['recipientList'] as String),
            _transactionListConverter.decode(row['transactionList'] as String),
            row['profileImg'] as String?));
  }

  @override
  Future<void> deleteData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM UserData');
  }

  @override
  Future<void> addUserData(UserData person) async {
    await _userDataInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _accountDetailsConverter = AccountDetailsConverter();
final _cardListConverter = CardListConverter();
final _recipientListConverter = RecipientListConverter();
final _transactionListConverter = TransactionListConverter();
