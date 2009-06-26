package App::Grok::Pod5;

use strict;
use warnings;

our $VERSION = '0.05';

sub new {
    my ($package, %self) = @_;
    return bless \%self, $package;
}

sub render {
    my ($self, $file, $format) = @_;

    my $formatter = $format eq 'ansi'
        ? 'Pod::Text::Color'
        : 'Pod::Text'
    ;

    eval "require $formatter";
    die $@ if $@;

    my $pod = '';
    open my $out_fh, '>', \$pod or die "Can't open output filehandle: $!";
    binmode $out_fh, ':utf8';
    $formatter->new->parse_from_file($file, $out_fh);
    return $pod;
}

1;

=head1 NAME

App::Grok::Pod5 - A Pod 5 backend for grok

=head1 AUTHOR

Hinrik Örn Sigurðsson, L<hinrik.sig@gmail.com>

=head1 LICENSE AND COPYRIGHT

Copyright 2009 Hinrik Örn Sigurðsson

C<grok> is distributed under the terms of the Artistic License 2.0.
For more details, see the full text of the license in the file F<LICENSE>
that came with this distribution.

=cut