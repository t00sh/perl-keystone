use 5.014000;
use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $cflags = `pkg-config --cflags keystone`;
chomp $cflags if $cflags;
my $define = '-DKEYSTONE_FROM_PKGCONFIG' if $cflags;
my $ldflags = `pkg-config --libs keystone` || '-lkeystone';
chomp $ldflags if $ldflags;

WriteMakefile(
    NAME              => 'Keystone',
    VERSION_FROM      => 'lib/Keystone.pm',
    PREREQ_PM         => {},
    ABSTRACT_FROM     => 'lib/Keystone.pm',
    AUTHOR            => 'Tosh <tosh@t0x0sh.org>',
    LICENSE           => 'GPL_3',
    LIBS              => [$ldflags],
    DEFINE            => $define || '',
    INC               => ($cflags || '') . ' -I.',
);
